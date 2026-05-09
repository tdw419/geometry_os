; DESCRIPTION: Places a black 82x99 rectangle at position (214, 135).
; PLAN: r0=214(x), r1=135(y), r2=82(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 135
LDI r2, 82
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
