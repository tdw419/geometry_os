; DESCRIPTION: Renders a orange box of size 118x83 starting at (298, 117).
; PLAN: r0=298(x), r1=117(y), r2=118(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 117
LDI r2, 118
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
