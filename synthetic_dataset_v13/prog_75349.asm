; DESCRIPTION: Places a black 13x111 rectangle at position (401, 95).
; PLAN: r0=401(x), r1=95(y), r2=13(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 95
LDI r2, 13
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
