; DESCRIPTION: Renders a orange box of size 94x80 starting at (322, 36).
; PLAN: r0=322(x), r1=36(y), r2=94(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 36
LDI r2, 94
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
