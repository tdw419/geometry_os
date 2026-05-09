; DESCRIPTION: Places a orange 96x111 rectangle at position (96, 4).
; PLAN: r0=96(x), r1=4(y), r2=96(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 4
LDI r2, 96
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
