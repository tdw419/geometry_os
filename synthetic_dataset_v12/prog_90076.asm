; DESCRIPTION: Places a white 65x16 rectangle at position (305, 119).
; PLAN: r0=305(x), r1=119(y), r2=65(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 119
LDI r2, 65
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
