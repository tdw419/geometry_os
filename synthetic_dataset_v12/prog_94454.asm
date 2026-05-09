; DESCRIPTION: Places a white 106x31 rectangle at position (240, 86).
; PLAN: r0=240(x), r1=86(y), r2=106(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 86
LDI r2, 106
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
