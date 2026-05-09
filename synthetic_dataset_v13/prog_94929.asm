; DESCRIPTION: Places a cyan 82x31 rectangle at position (302, 180).
; PLAN: r0=302(x), r1=180(y), r2=82(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 180
LDI r2, 82
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
