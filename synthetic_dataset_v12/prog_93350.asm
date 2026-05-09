; DESCRIPTION: Renders a red box of size 106x75 starting at (79, 174).
; PLAN: r0=79(x), r1=174(y), r2=106(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 174
LDI r2, 106
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
