; DESCRIPTION: Composite: Places a cyan circle of radius 42 at center (174, 146) then Renders a purple box of size 118x30 starting at (268, 144) then Sets a single red pixel at (435, 177).
; PLAN: r0=174(x), r1=146(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=144(y), r7=118(width), r8=30(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=177(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 146
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 144
LDI r7, 118
LDI r8, 30
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 177
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
