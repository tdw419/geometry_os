; DESCRIPTION: Renders a orange box of size 57x56 starting at (437, 107).
; PLAN: r0=437(x), r1=107(y), r2=57(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 107
LDI r2, 57
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
