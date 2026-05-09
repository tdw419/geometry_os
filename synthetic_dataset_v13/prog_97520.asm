; DESCRIPTION: Places a white 106x40 rectangle at position (198, 83).
; PLAN: r0=198(x), r1=83(y), r2=106(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 83
LDI r2, 106
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
