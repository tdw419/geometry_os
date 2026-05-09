; DESCRIPTION: Places a cyan 46x73 rectangle at position (16, 169).
; PLAN: r0=16(x), r1=169(y), r2=46(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 169
LDI r2, 46
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
