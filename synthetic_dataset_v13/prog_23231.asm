; DESCRIPTION: Places a cyan 24x33 rectangle at position (127, 79).
; PLAN: r0=127(x), r1=79(y), r2=24(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 79
LDI r2, 24
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
