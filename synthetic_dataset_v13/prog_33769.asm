; DESCRIPTION: Places a cyan 106x84 rectangle at position (221, 171).
; PLAN: r0=221(x), r1=171(y), r2=106(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 171
LDI r2, 106
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
