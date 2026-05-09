; DESCRIPTION: Places a white 27x75 rectangle at position (468, 13).
; PLAN: r0=468(x), r1=13(y), r2=27(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 13
LDI r2, 27
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
