; DESCRIPTION: Composite: Places a cyan 82x112 rectangle at position (281, 134) then Places a red circle of radius 73 at center (207, 150) then Places a yellow dot at position (431, 242).
; PLAN: r0=281(x), r1=134(y), r2=82(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=150(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=242(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 134
LDI r2, 82
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 150
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 242
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
