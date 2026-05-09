; DESCRIPTION: Renders a orange box of size 94x117 starting at (79, 25).
; PLAN: r0=79(x), r1=25(y), r2=94(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 25
LDI r2, 94
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
