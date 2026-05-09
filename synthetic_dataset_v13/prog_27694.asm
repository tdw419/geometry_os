; DESCRIPTION: Places a green 38x43 rectangle at position (198, 135).
; PLAN: r0=198(x), r1=135(y), r2=38(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 135
LDI r2, 38
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
