; DESCRIPTION: Places a orange 87x111 rectangle at position (395, 27).
; PLAN: r0=395(x), r1=27(y), r2=87(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 27
LDI r2, 87
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
