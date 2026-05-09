; DESCRIPTION: Renders a orange box of size 111x61 starting at (201, 30).
; PLAN: r0=201(x), r1=30(y), r2=111(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 30
LDI r2, 111
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
