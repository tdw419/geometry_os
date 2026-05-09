; DESCRIPTION: Places a cyan 104x66 rectangle at position (322, 173).
; PLAN: r0=322(x), r1=173(y), r2=104(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 173
LDI r2, 104
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
