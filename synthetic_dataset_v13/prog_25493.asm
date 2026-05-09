; DESCRIPTION: Composite: Renders a green box of size 28x66 starting at (156, 177) then Draws a white line from (397, 93) to (313, 129) then Sets a single purple pixel at (434, 8).
; PLAN: r0=156(x), r1=177(y), r2=28(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x1), r6=93(y1), r7=313(x2), r8=129(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=8(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 177
LDI r2, 28
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 93
LDI r7, 313
LDI r8, 129
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 8
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
