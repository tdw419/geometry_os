; DESCRIPTION: Places a cyan 105x35 rectangle at position (387, 165).
; PLAN: r0=387(x), r1=165(y), r2=105(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 165
LDI r2, 105
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
