; DESCRIPTION: Places a yellow 110x85 rectangle at position (214, 113).
; PLAN: r0=214(x), r1=113(y), r2=110(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 113
LDI r2, 110
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
