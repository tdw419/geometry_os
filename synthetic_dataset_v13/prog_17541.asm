; DESCRIPTION: Places a black 36x27 rectangle at position (315, 172).
; PLAN: r0=315(x), r1=172(y), r2=36(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 172
LDI r2, 36
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
