; DESCRIPTION: Places a cyan 120x58 rectangle at position (160, 180).
; PLAN: r0=160(x), r1=180(y), r2=120(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 180
LDI r2, 120
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
