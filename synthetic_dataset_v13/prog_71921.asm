; DESCRIPTION: Places a white 115x54 rectangle at position (27, 55).
; PLAN: r0=27(x), r1=55(y), r2=115(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 55
LDI r2, 115
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
