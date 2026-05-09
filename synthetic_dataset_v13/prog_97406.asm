; DESCRIPTION: Renders a orange box of size 18x46 starting at (179, 111).
; PLAN: r0=179(x), r1=111(y), r2=18(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 111
LDI r2, 18
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
