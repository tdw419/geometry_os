; DESCRIPTION: Renders a orange box of size 120x37 starting at (333, 33).
; PLAN: r0=333(x), r1=33(y), r2=120(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 33
LDI r2, 120
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
