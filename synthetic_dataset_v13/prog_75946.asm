; DESCRIPTION: Places a cyan 46x64 rectangle at position (177, 150).
; PLAN: r0=177(x), r1=150(y), r2=46(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 150
LDI r2, 46
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
