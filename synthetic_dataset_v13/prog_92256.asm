; DESCRIPTION: Composite: Renders a cyan box of size 106x16 starting at (329, 161) then Draws a red circle centered at (180, 109) with radius 68.
; PLAN: r0=329(x), r1=161(y), r2=106(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=109(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 161
LDI r2, 106
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 109
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
