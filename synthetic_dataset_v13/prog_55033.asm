; DESCRIPTION: Places a cyan 16x20 rectangle at position (153, 169).
; PLAN: r0=153(x), r1=169(y), r2=16(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 169
LDI r2, 16
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
