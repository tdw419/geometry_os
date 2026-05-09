; DESCRIPTION: Places a yellow 79x45 rectangle at position (293, 50).
; PLAN: r0=293(x), r1=50(y), r2=79(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 50
LDI r2, 79
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
