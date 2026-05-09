; DESCRIPTION: Places a green 15x61 rectangle at position (368, 154).
; PLAN: r0=368(x), r1=154(y), r2=15(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 154
LDI r2, 15
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
