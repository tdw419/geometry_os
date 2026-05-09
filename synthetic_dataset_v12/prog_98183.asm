; DESCRIPTION: Composite: Renders a magenta disk with center (229, 46) and radius 42 then Places a blue 115x62 rectangle at position (146, 127) then Places a cyan dot at position (268, 64).
; PLAN: r0=229(x), r1=46(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=127(y), r7=115(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=64(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 46
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 127
LDI r7, 115
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 64
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
