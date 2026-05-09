; DESCRIPTION: Places a black 106x86 rectangle at position (313, 120).
; PLAN: r0=313(x), r1=120(y), r2=106(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 120
LDI r2, 106
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
