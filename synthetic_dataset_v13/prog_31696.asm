; DESCRIPTION: Renders a orange box of size 48x91 starting at (334, 161).
; PLAN: r0=334(x), r1=161(y), r2=48(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 161
LDI r2, 48
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
