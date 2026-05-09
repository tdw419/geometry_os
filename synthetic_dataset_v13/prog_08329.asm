; DESCRIPTION: Places a cyan 27x92 rectangle at position (223, 154).
; PLAN: r0=223(x), r1=154(y), r2=27(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 154
LDI r2, 27
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
