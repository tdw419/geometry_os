; DESCRIPTION: Places a green 37x76 rectangle at position (298, 133).
; PLAN: r0=298(x), r1=133(y), r2=37(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 133
LDI r2, 37
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
