; DESCRIPTION: Renders a orange box of size 39x115 starting at (418, 94).
; PLAN: r0=418(x), r1=94(y), r2=39(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 94
LDI r2, 39
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
