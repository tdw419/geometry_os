; DESCRIPTION: Renders a orange box of size 93x79 starting at (243, 75).
; PLAN: r0=243(x), r1=75(y), r2=93(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 75
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
