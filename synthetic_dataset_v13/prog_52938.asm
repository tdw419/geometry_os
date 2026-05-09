; DESCRIPTION: Places a cyan 120x25 rectangle at position (46, 119).
; PLAN: r0=46(x), r1=119(y), r2=120(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 119
LDI r2, 120
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
