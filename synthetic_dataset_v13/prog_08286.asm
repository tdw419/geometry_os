; DESCRIPTION: Renders a orange box of size 82x77 starting at (428, 94).
; PLAN: r0=428(x), r1=94(y), r2=82(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 94
LDI r2, 82
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
