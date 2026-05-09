; DESCRIPTION: Places a yellow 82x45 rectangle at position (297, 45).
; PLAN: r0=297(x), r1=45(y), r2=82(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 45
LDI r2, 82
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
