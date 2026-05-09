; DESCRIPTION: Places a white 80x61 rectangle at position (221, 65).
; PLAN: r0=221(x), r1=65(y), r2=80(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 65
LDI r2, 80
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
