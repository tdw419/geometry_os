; DESCRIPTION: Draws a red rectangle at (154, 33) with width 45 and height 90.
; PLAN: r0=154(x), r1=33(y), r2=45(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 33
LDI r2, 45
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
