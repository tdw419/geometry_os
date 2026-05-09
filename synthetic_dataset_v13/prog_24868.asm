; DESCRIPTION: Places a white 91x20 rectangle at position (223, 229).
; PLAN: r0=223(x), r1=229(y), r2=91(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 229
LDI r2, 91
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
