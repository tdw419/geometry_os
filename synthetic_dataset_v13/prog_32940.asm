; DESCRIPTION: Places a red 79x45 rectangle at position (221, 48).
; PLAN: r0=221(x), r1=48(y), r2=79(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 48
LDI r2, 79
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
