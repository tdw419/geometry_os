; DESCRIPTION: Places a yellow 100x17 rectangle at position (228, 237).
; PLAN: r0=228(x), r1=237(y), r2=100(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 237
LDI r2, 100
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
