; DESCRIPTION: Places a yellow 40x49 rectangle at position (198, 125).
; PLAN: r0=198(x), r1=125(y), r2=40(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 125
LDI r2, 40
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
