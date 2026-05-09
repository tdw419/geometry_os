; DESCRIPTION: Renders a orange box of size 57x39 starting at (190, 200).
; PLAN: r0=190(x), r1=200(y), r2=57(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 200
LDI r2, 57
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
