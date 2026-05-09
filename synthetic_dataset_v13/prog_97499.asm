; DESCRIPTION: Composite: Renders a green line between points (173, 196) and (502, 28) then Renders a cyan box of size 44x60 starting at (202, 128).
; PLAN: r0=173(x1), r1=196(y1), r2=502(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=128(y), r7=44(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 196
LDI r2, 502
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 128
LDI r7, 44
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
