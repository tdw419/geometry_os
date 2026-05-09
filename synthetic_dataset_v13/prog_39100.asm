; DESCRIPTION: Places a cyan 116x102 rectangle at position (228, 146).
; PLAN: r0=228(x), r1=146(y), r2=116(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 146
LDI r2, 116
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
