; counted animation
; initialization
  LDI r4, 0xEC057A
  LDI r5, 4
  LDI r8, 0xAA75B1
loop_0:
  SUBI r12, r13, 185
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_0
  LDI r0, 0x27D3D2
loop_1:
  ADDI r7, r10, 256
  LDI r3, 1
  SUB r0, r0, r3
  JNZ r0, loop_1
  LDI r12, 42
loop_2:
  LDI r1, 2963
  LDI r7, 0x1F0E71
  LDI r15, 4
  PSETI
  LDI r14, 1
  LDI r13, 917
  LDI r4, 0x076D80
  LDI r13, 16
  LDI r8, 0x8BAE4E
  LINE r14, r13, r4, r13, r8
  ADDI r0, r14, 0xF4C9DB
  LDI r5, 1
  SUB r12, r12, r5
  JNZ r12, loop_2
  HALT
