; DESCRIPTION: Renders a orange box of size 91x16 starting at (160, 124).
; PLAN: r0=160(x), r1=124(y), r2=91(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 124
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
