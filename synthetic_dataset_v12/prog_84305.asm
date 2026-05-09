; DESCRIPTION: Places a white 91x105 rectangle at position (180, 54).
; PLAN: r0=180(x), r1=54(y), r2=91(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 54
LDI r2, 91
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
