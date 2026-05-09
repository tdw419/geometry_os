; DESCRIPTION: Composite: Renders a cyan line between points (344, 242) and (224, 13) then Places a blue 48x91 rectangle at position (70, 156) then Places a magenta dot at position (77, 238).
; PLAN: r0=344(x1), r1=242(y1), r2=224(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=156(y), r7=48(width), r8=91(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=77(x), r11=238(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 242
LDI r2, 224
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 156
LDI r7, 48
LDI r8, 91
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 238
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
